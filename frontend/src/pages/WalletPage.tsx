import { useState } from 'react';
import { useTheme } from '../context/ThemeContext';
import DashboardLayout from '../components/DashboardLayout';
import {
    Wallet,
    ArrowUpRight,
    ArrowDownLeft,
    Plus,
    CreditCard,
    History,
    MoreHorizontal,
    Download
} from 'lucide-react';
import toast, { Toaster } from 'react-hot-toast';

const WalletPage = () => {
    const { isDarkMode } = useTheme();

    // Mock Data
    const [balance, setBalance] = useState(50000);
    const [income, setIncome] = useState(120000);
    const [expenses, setExpenses] = useState(70000);

    const [transactions, setTransactions] = useState([
        { id: 1, type: 'credit', description: 'Deposit via Paystack', amount: 20000, date: '2025-01-04T10:30:00', status: 'success' },
        { id: 2, type: 'debit', description: 'Course Material Purchase', amount: 5000, date: '2025-01-03T14:20:00', status: 'success' },
        { id: 3, type: 'debit', description: 'Monthly Subscription', amount: 2000, date: '2025-01-01T09:00:00', status: 'success' },
        { id: 4, type: 'credit', description: 'Referral Bonus', amount: 1000, date: '2024-12-28T11:15:00', status: 'success' },
        { id: 5, type: 'debit', description: 'Exam Registration', amount: 15000, date: '2024-12-25T16:45:00', status: 'pending' },
    ]);

    const handleDeposit = () => {
        toast.success('Redirecting to payment gateway...');
        // Future integration with Paystack/Flutterwave
    };

    const handleWithdraw = () => {
        toast.success('Withdrawal request initiated.');
    };

    const formatCurrency = (amount: number) => {
        return new Intl.NumberFormat('en-NG', {
            style: 'currency',
            currency: 'NGN'
        }).format(amount);
    };

    return (
        <DashboardLayout currentPage="/wallet">
            <Toaster position="top-center" reverseOrder={false} />

            <div className="max-w-7xl mx-auto space-y-8 animate-in fade-in duration-500">

                {/* Header */}
                <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">
                    <div>
                        <h1 className={`text-3xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                            My Wallet
                        </h1>
                        <p className={`mt-1 ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                            Manage your finances, transactions, and payments.
                        </p>
                    </div>
                    <div className="flex gap-3">
                        <button
                            onClick={handleWithdraw}
                            className={`px-4 py-2 rounded-lg font-medium transition-all flex items-center gap-2 ${isDarkMode
                                    ? 'bg-gray-800 text-white hover:bg-gray-700 border border-gray-700'
                                    : 'bg-white text-gray-700 hover:bg-gray-50 border border-gray-200'
                                }`}
                        >
                            <ArrowUpRight size={18} />
                            Withdraw
                        </button>
                        <button
                            onClick={handleDeposit}
                            className="px-4 py-2 bg-gradient-to-r from-primary-600 to-primary-700 text-white rounded-lg font-medium shadow-lg shadow-primary-500/30 hover:shadow-primary-500/40 hover:scale-[1.02] active:scale-[0.98] transition-all flex items-center gap-2"
                        >
                            <Plus size={18} />
                            Add Funds
                        </button>
                    </div>
                </div>

                {/* Cards Grid */}
                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">

                    {/* Main Balance Card */}
                    <div className="relative overflow-hidden rounded-2xl p-6 bg-gradient-to-br from-gray-900 to-gray-800 text-white shadow-xl">
                        <div className="absolute top-0 right-0 p-4 opacity-10">
                            <Wallet size={120} />
                        </div>
                        <div className="relative z-10">
                            <p className="text-gray-400 text-sm font-medium mb-1">Total Balance</p>
                            <h2 className="text-4xl font-bold mb-4">{formatCurrency(balance)}</h2>
                            <div className="flex items-center gap-2 text-sm text-gray-300 bg-white/10 w-fit px-3 py-1 rounded-full backdrop-blur-sm">
                                <CreditCard size={14} />
                                <span>**** **** **** 4242</span>
                            </div>
                        </div>
                    </div>

                    {/* Income Card */}
                    <div className={`rounded-2xl p-6 shadow-sm border ${isDarkMode ? 'bg-gray-800 border-gray-700' : 'bg-white border-gray-100'}`}>
                        <div className="flex items-start justify-between mb-4">
                            <div className={`p-3 rounded-xl ${isDarkMode ? 'bg-green-500/20 text-green-400' : 'bg-green-50 text-green-600'}`}>
                                <ArrowDownLeft size={24} />
                            </div>
                            <span className={`text-xs font-semibold px-2 py-1 rounded-full ${isDarkMode ? 'bg-gray-700 text-green-400' : 'bg-green-50 text-green-700'}`}>
                                +12%
                            </span>
                        </div>
                        <p className={`text-sm font-medium mb-1 ${isDarkMode ? 'text-gray-400' : 'text-gray-500'}`}>Total Income</p>
                        <h3 className={`text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>{formatCurrency(income)}</h3>
                    </div>

                    {/* Expenses Card */}
                    <div className={`rounded-2xl p-6 shadow-sm border ${isDarkMode ? 'bg-gray-800 border-gray-700' : 'bg-white border-gray-100'}`}>
                        <div className="flex items-start justify-between mb-4">
                            <div className={`p-3 rounded-xl ${isDarkMode ? 'bg-red-500/20 text-red-400' : 'bg-red-50 text-red-600'}`}>
                                <ArrowUpRight size={24} />
                            </div>
                            <span className={`text-xs font-semibold px-2 py-1 rounded-full ${isDarkMode ? 'bg-gray-700 text-red-400' : 'bg-red-50 text-red-700'}`}>
                                -5%
                            </span>
                        </div>
                        <p className={`text-sm font-medium mb-1 ${isDarkMode ? 'text-gray-400' : 'text-gray-500'}`}>Total Expenses</p>
                        <h3 className={`text-2xl font-bold ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>{formatCurrency(expenses)}</h3>
                    </div>
                </div>

                {/* Transaction History Section */}
                <div className={`rounded-2xl border shadow-sm ${isDarkMode ? 'bg-gray-800 border-gray-700' : 'bg-white border-gray-100'}`}>
                    <div className="p-6 border-b border-gray-200 dark:border-gray-700 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                        <h2 className={`text-xl font-bold flex items-center gap-2 ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>
                            <History size={20} className="text-primary-500" />
                            Transaction History
                        </h2>
                        <button className={`text-sm font-medium flex items-center gap-1 ${isDarkMode ? 'text-gray-400 hover:text-white' : 'text-gray-500 hover:text-gray-900'}`}>
                            <Download size={16} />
                            Export CSV
                        </button>
                    </div>

                    <div className="overflow-x-auto">
                        <table className="w-full">
                            <thead className={`text-xs uppercase font-semibold ${isDarkMode ? 'bg-gray-900/50 text-gray-400' : 'bg-gray-50 text-gray-500'}`}>
                                <tr>
                                    <th className="px-6 py-4 text-left">Transaction</th>
                                    <th className="px-6 py-4 text-left">Date</th>
                                    <th className="px-6 py-4 text-left">Status</th>
                                    <th className="px-6 py-4 text-right">Amount</th>
                                    <th className="px-6 py-4 text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody className={`divide-y ${isDarkMode ? 'divide-gray-700' : 'divide-gray-100'}`}>
                                {transactions.map((tx) => (
                                    <tr key={tx.id} className={`group transition-colors ${isDarkMode ? 'hover:bg-gray-700/50' : 'hover:bg-gray-50'}`}>
                                        <td className="px-6 py-4">
                                            <div className="flex items-center gap-3">
                                                <div className={`p-2 rounded-lg ${tx.type === 'credit'
                                                        ? isDarkMode ? 'bg-green-500/10 text-green-400' : 'bg-green-50 text-green-600'
                                                        : isDarkMode ? 'bg-red-500/10 text-red-400' : 'bg-red-50 text-red-600'
                                                    }`}>
                                                    {tx.type === 'credit' ? <ArrowDownLeft size={18} /> : <ArrowUpRight size={18} />}
                                                </div>
                                                <div>
                                                    <p className={`font-medium ${isDarkMode ? 'text-white' : 'text-gray-900'}`}>{tx.description}</p>
                                                    <p className={`text-xs ${isDarkMode ? 'text-gray-500' : 'text-gray-400'}`}>{tx.type === 'credit' ? 'Incoming Transfer' : 'Payment'}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td className={`px-6 py-4 text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-600'}`}>
                                            {new Date(tx.date).toLocaleDateString()} <span className="text-xs opacity-60 ml-1">{new Date(tx.date).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</span>
                                        </td>
                                        <td className="px-6 py-4">
                                            <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${tx.status === 'success'
                                                    ? isDarkMode ? 'bg-green-500/10 text-green-400' : 'bg-green-100 text-green-800'
                                                    : isDarkMode ? 'bg-yellow-500/10 text-yellow-400' : 'bg-yellow-100 text-yellow-800'
                                                }`}>
                                                {tx.status.charAt(0).toUpperCase() + tx.status.slice(1)}
                                            </span>
                                        </td>
                                        <td className={`px-6 py-4 text-right font-medium ${tx.type === 'credit'
                                                ? 'text-green-500'
                                                : isDarkMode ? 'text-white' : 'text-gray-900'
                                            }`}>
                                            {tx.type === 'credit' ? '+' : '-'}{formatCurrency(tx.amount)}
                                        </td>
                                        <td className="px-6 py-4 text-center">
                                            <button className={`p-1 rounded opacity-0 group-hover:opacity-100 transition-opacity ${isDarkMode ? 'hover:bg-gray-600 text-gray-400' : 'hover:bg-gray-100 text-gray-500'}`}>
                                                <MoreHorizontal size={18} />
                                            </button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>

                    {/* Pagination (Mock) */}
                    <div className={`p-4 border-t flex items-center justify-between ${isDarkMode ? 'border-gray-700' : 'border-gray-200'}`}>
                        <p className={`text-sm ${isDarkMode ? 'text-gray-400' : 'text-gray-500'}`}>
                            Showing 1-5 of 12 results
                        </p>
                        <div className="flex gap-2">
                            <button disabled className={`px-3 py-1 rounded text-sm ${isDarkMode ? 'bg-gray-700 text-gray-500' : 'bg-gray-100 text-gray-400'} cursor-not-allowed`}>Previous</button>
                            <button className={`px-3 py-1 rounded text-sm ${isDarkMode ? 'bg-gray-700 text-white hover:bg-gray-600' : 'bg-white border text-gray-700 hover:bg-gray-50'}`}>Next</button>
                        </div>
                    </div>
                </div>

            </div>
        </DashboardLayout>
    );
};

export default WalletPage;
